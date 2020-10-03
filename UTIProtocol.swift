//
//  UTIProtocol.swift
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

public enum UTIRepresentation {
	case fileExtension;
	case mimeType;
	
	internal var value: CFString {
		switch (self) {
		case .fileExtension:
			return kUTTagClassFilenameExtension;
		case .mimeType:
			return kUTTagClassMIMEType;
		}
	}
}

public protocol UTIProtocol: Hashable, RawRepresentable, _ObjectiveCBridgeable where RawValue == String {
	typealias Representation = UTIRepresentation;
	
	static func types (_ representation: Representation, value: String) -> [Self];
	static func types (_ representation: Representation, value: String, conformingTo parent: Self) -> [Self];

	var isDeclared: Bool { get }
	var isDynamic: Bool { get }
	var localizedDescription: String? { get }
	
	init? (_ representation: Representation, value: String);
	init? (_ representation: Representation, value: String, conformingTo parent: Self);

	func conforms (to other: Self) -> Bool;
	
	func preferredRepresentation (_ representation: Representation) -> String?;
	func representations (_ representation: Representation) -> [String];
}

/* public */ extension UTIProtocol {
	public static func types (forFilenameExtension filenameExtension: String) -> [Self] {
		self.types (.fileExtension, value: filenameExtension)
	}
	
	public static func types (forFilenameExtension filenameExtension: String, conformingTo parent: Self) -> [Self] {
		self.types (.fileExtension, value: filenameExtension, conformingTo: parent)
	}
	
	public static func types (forMIMEType mimeType: String) -> [Self] {
		self.types (.mimeType, value: mimeType)
	}
	
	public static func types (forMIMEType mimeType: String, conformingTo parent: Self) -> [Self] {
		self.types (.mimeType, value: mimeType, conformingTo: parent)
	}

	public var preferredFilenameExtension: String? { self.preferredRepresentation (.fileExtension) }
	public var preferredMIMEType: String? { self.preferredRepresentation (.mimeType) }

	public var filenameExtensions: [String] { self.representations (.fileExtension) }
	public var mimeTypes: [String] { self.representations (.mimeType) }
	
	public init? (filenameExtension: String) {
		self.init (.fileExtension, value: filenameExtension);
	}
	
	public init? (filenameExtension: String, conformingTo parent: Self) {
		self.init (.fileExtension, value: filenameExtension, conformingTo: parent);
	}
	
	public init? (mimeType: String) {
		self.init (.mimeType, value: mimeType);
	}
	
	public init? (mimeType: String, conformingTo parent: Self) {
		self.init (.mimeType, value: mimeType, conformingTo: parent);
	}
}
