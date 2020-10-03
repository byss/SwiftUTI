//
//  UTI.swift
//  SwiftUTI
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if os (macOS)
import CoreServices
#elseif os (iOS) || os (watchOS) || os (tvOS)
import MobileCoreServices
#else
#warning ("This platform is not fully supported yet")
#endif

import Foundation

public struct UTI {
	internal typealias Backing = CFString;
	
	internal let value: Backing;
	
	internal init (_ value: Backing) {
		self.value = value;
	}
}

extension UTI: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool { UTTypeEqual (lhs.value, rhs.value) }
}

extension UTI: Hashable {}

extension UTI: RawRepresentable {
	public var rawValue: String { self.value as String }
	
	public init (rawValue: String) {
		self.init (rawValue as CFString);
	}
}

extension UTI: _ObjectiveCBridgeable {
	public typealias _ObjectiveCType = CFString;
	
	@discardableResult
	public static func _conditionallyBridgeFromObjectiveC (_ source: CFString, result: inout Self?) -> Bool {
		result = .init (source);
		return true;
	}

	public static func _forceBridgeFromObjectiveC (_ source: CFString, result: inout Self?) {
		self._conditionallyBridgeFromObjectiveC (source, result: &result)
	}
	
	public static func _unconditionallyBridgeFromObjectiveC (_ source: CFString?) -> Self { .init (source!) }

	public func _bridgeToObjectiveC () -> CFString { self.value }
}

extension UTI: UTIProtocol {
	public static func types (_ representation: Representation, value: String) -> [Self] {
		self.types (representation, value: value, conformingTo: nil)
	}
	
	public static func types (_ representation: Representation, value: String, conformingTo parent: Self) -> [Self] {
		self.types (representation, value: value, conformingTo: .some (parent))
	}

	private static func types (_ representation: Representation, value: String, conformingTo parent: Self?) -> [Self] {
		guard let result = UTTypeCreateAllIdentifiersForTag (representation.value, value as CFString, parent?.value)?.takeUnretainedValue () else {
			return [];
		}
		return (0 ..< CFArrayGetCount (result)).compactMap {
			let value = unsafeBitCast (CFArrayGetValueAtIndex (result, $0), to: CFTypeRef.self);
			return (CFGetTypeID (value) == CFStringGetTypeID ()) ? .init (unsafeBitCast (value, to: CFString.self)) : nil;
		};
	}
	
	public var isDeclared: Bool { UTTypeIsDeclared (self.value) }
	public var isDynamic: Bool { UTTypeIsDynamic (self.value)  }

	public var localizedDescription: String? { UTTypeCopyDescription (self.value).map { $0.takeUnretainedValue () as String } }
	
	public init? (_ representation: Representation, value: String) {
		self.init (representation, value: value, conformingTo: nil);
	}

	public init? (_ representation: Representation, value: String, conformingTo parent: Self) {
		self.init (representation, value: value, conformingTo: .some (parent));
	}

	private init? (_ representation: Representation, value: String, conformingTo parent: Self?) {
		guard let value = UTTypeCreatePreferredIdentifierForTag (representation.value, value as CFString, parent?.value)?.takeUnretainedValue () else {
			return nil;
		}
		self.init (value);
	}
	
	public func conforms (to other: Self) -> Bool { UTTypeConformsTo (self.value, other.value) }
	
	public func preferredRepresentation (_ representation: Representation) -> String? {
		UTTypeCopyPreferredTagWithClass (self.value, representation.value)?.takeUnretainedValue () as String?
	}
	
	public func representations (_ representation: Representation) -> [String] {
		guard let result = UTTypeCopyAllTagsWithClass (self.value, representation.value)?.takeUnretainedValue () else {
			return [];
		}		
		return (0 ..< CFArrayGetCount (result)).compactMap {
			let value = unsafeBitCast (CFArrayGetValueAtIndex (result, $0), to: CFTypeRef.self);
			return (CFGetTypeID (value) == CFStringGetTypeID ()) ? unsafeBitCast (value, to: CFString.self) as String : nil;
		};
	}
}
