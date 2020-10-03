//
//  UTI+predefined.swift
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

/* public */ extension UTI {
	public static let item                       = kUTTypeItem                       as UTI;
	public static let content                    = kUTTypeContent                    as UTI;
	public static let compositeContent           = kUTTypeCompositeContent           as UTI;
	public static let message                    = kUTTypeMessage                    as UTI;
	public static let contact                    = kUTTypeContact                    as UTI;
	public static let archive                    = kUTTypeArchive                    as UTI;
	public static let diskImage                  = kUTTypeDiskImage                  as UTI;
	
	public static let data                       = kUTTypeData                       as UTI;
	public static let directory                  = kUTTypeDirectory                  as UTI;
	public static let resolvable                 = kUTTypeResolvable                 as UTI;
	public static let symLink                    = kUTTypeSymLink                    as UTI;
	public static let executable                 = kUTTypeExecutable                 as UTI;
	public static let mountPoint                 = kUTTypeMountPoint                 as UTI;
	public static let aliasFile                  = kUTTypeAliasFile                  as UTI;
	public static let aliasRecord                = kUTTypeAliasRecord                as UTI;
	public static let urlBookmarkData            = kUTTypeURLBookmarkData            as UTI;
	
	public static let url                        = kUTTypeURL                        as UTI;
	public static let fileURL                    = kUTTypeFileURL                    as UTI;
	
	public static let text                       = kUTTypeText                       as UTI;
	public static let plainText                  = kUTTypePlainText                  as UTI;
	public static let utf8PlainText              = kUTTypeUTF8PlainText              as UTI;
	public static let utf16ExternalPlainText     = kUTTypeUTF16ExternalPlainText     as UTI;
	public static let utf16PlainText             = kUTTypeUTF16PlainText             as UTI;
	public static let delimitedText              = kUTTypeDelimitedText              as UTI;
	public static let commaSeparatedText         = kUTTypeCommaSeparatedText         as UTI;
	public static let tabSeparatedText           = kUTTypeTabSeparatedText           as UTI;
	public static let utf8TabSeparatedText       = kUTTypeUTF8TabSeparatedText       as UTI;
	public static let rtf                        = kUTTypeRTF                        as UTI;
	
	public static let html                       = kUTTypeHTML                       as UTI;
	public static let xml                        = kUTTypeXML                        as UTI;
	
	public static let sourceCode                 = kUTTypeSourceCode                 as UTI;
	public static let assemblyLanguageSource     = kUTTypeAssemblyLanguageSource     as UTI;
	public static let cSource                    = kUTTypeCSource                    as UTI;
	public static let objectiveCSource           = kUTTypeObjectiveCSource           as UTI;
	public static let swiftSource                = kUTTypeSwiftSource                as UTI;
	public static let cPlusPlusSource            = kUTTypeCPlusPlusSource            as UTI;
	public static let objectiveCPlusPlusSource   = kUTTypeObjectiveCPlusPlusSource   as UTI;
	public static let cHeader                    = kUTTypeCHeader                    as UTI;
	public static let cPlusPlusHeader            = kUTTypeCPlusPlusHeader            as UTI;
	public static let javaSource                 = kUTTypeJavaSource                 as UTI;
	
	public static let script                     = kUTTypeScript                     as UTI;
	public static let appleScript                = kUTTypeAppleScript                as UTI;
	public static let osaScript                  = kUTTypeOSAScript                  as UTI;
	public static let osaScriptBundle            = kUTTypeOSAScriptBundle            as UTI;
	public static let javaScript                 = kUTTypeJavaScript                 as UTI;
	public static let shellScript                = kUTTypeShellScript                as UTI;
	public static let perlScript                 = kUTTypePerlScript                 as UTI;
	public static let pythonScript               = kUTTypePythonScript               as UTI;
	public static let rubyScript                 = kUTTypeRubyScript                 as UTI;
	public static let phpScript                  = kUTTypePHPScript                  as UTI;
	
	public static let json                       = kUTTypeJSON                       as UTI;
	public static let propertyList               = kUTTypePropertyList               as UTI;
	public static let xmlPropertyList            = kUTTypeXMLPropertyList            as UTI;
	public static let binaryPropertyList         = kUTTypeBinaryPropertyList         as UTI;
	
	public static let pdf                        = kUTTypePDF                        as UTI;
	public static let rtfd                       = kUTTypeRTFD                       as UTI;
	public static let flatRTFD                   = kUTTypeFlatRTFD                   as UTI;
	public static let txnTextAndMultimediaData   = kUTTypeTXNTextAndMultimediaData   as UTI;
	public static let webArchive                 = kUTTypeWebArchive                 as UTI;
	
	public static let image                      = kUTTypeImage                      as UTI;
	public static let jpeg                       = kUTTypeJPEG                       as UTI;
	public static let jpeg2000                   = kUTTypeJPEG2000                   as UTI;
	public static let tiff                       = kUTTypeTIFF                       as UTI;
	public static let pict                       = kUTTypePICT                       as UTI;
	public static let gif                        = kUTTypeGIF                        as UTI;
	public static let png                        = kUTTypePNG                        as UTI;
	public static let quickTimeImage             = kUTTypeQuickTimeImage             as UTI;
	public static let appleICNS                  = kUTTypeAppleICNS                  as UTI;
	public static let bmp                        = kUTTypeBMP                        as UTI;
	public static let ico                        = kUTTypeICO                        as UTI;
	public static let rawImage                   = kUTTypeRawImage                   as UTI;
	public static let scalableVectorGraphics     = kUTTypeScalableVectorGraphics     as UTI;
	public static let livePhoto                  = kUTTypeLivePhoto                  as UTI;
	
	public static let audiovisualContent         = kUTTypeAudiovisualContent         as UTI;
	public static let movie                      = kUTTypeMovie                      as UTI;
	public static let video                      = kUTTypeVideo                      as UTI;
	public static let audio                      = kUTTypeAudio                      as UTI;
	public static let quickTimeMovie             = kUTTypeQuickTimeMovie             as UTI;
	public static let mpeg                       = kUTTypeMPEG                       as UTI;
	public static let mpeg2Video                 = kUTTypeMPEG2Video                 as UTI;
	public static let mpeg2TransportStream       = kUTTypeMPEG2TransportStream       as UTI;
	public static let mp3                        = kUTTypeMP3                        as UTI;
	public static let mpeg4                      = kUTTypeMPEG4                      as UTI;
	public static let mpeg4Audio                 = kUTTypeMPEG4Audio                 as UTI;
	public static let appleProtectedMPEG4Audio   = kUTTypeAppleProtectedMPEG4Audio   as UTI;
	public static let appleProtectedMPEG4Video   = kUTTypeAppleProtectedMPEG4Video   as UTI;
	public static let aviMovie                   = kUTTypeAVIMovie                   as UTI;
	public static let audioInterchangeFileFormat = kUTTypeAudioInterchangeFileFormat as UTI;
	public static let waveformAudio              = kUTTypeWaveformAudio              as UTI;
	public static let midiAudio                  = kUTTypeMIDIAudio                  as UTI;
	
	public static let playlist                   = kUTTypePlaylist                   as UTI;
	public static let m3uPlaylist                = kUTTypeM3UPlaylist                as UTI;
	
	public static let folder                     = kUTTypeFolder                     as UTI;
	public static let volume                     = kUTTypeVolume                     as UTI;
	public static let package                    = kUTTypePackage                    as UTI;
	public static let bundle                     = kUTTypeBundle                     as UTI;
	public static let pluginBundle               = kUTTypePluginBundle               as UTI;
	public static let spotlightImporter          = kUTTypeSpotlightImporter          as UTI;
	public static let quickLookGenerator         = kUTTypeQuickLookGenerator         as UTI;
	public static let xpcService                 = kUTTypeXPCService                 as UTI;
	public static let framework                  = kUTTypeFramework                  as UTI;
	
	public static let application                = kUTTypeApplication                as UTI;
	public static let applicationBundle          = kUTTypeApplicationBundle          as UTI;
	public static let applicationFile            = kUTTypeApplicationFile            as UTI;
	public static let unixExecutable             = kUTTypeUnixExecutable             as UTI;
	
	public static let windowsExecutable          = kUTTypeWindowsExecutable          as UTI;
	public static let javaClass                  = kUTTypeJavaClass                  as UTI;
	public static let javaArchive                = kUTTypeJavaArchive                as UTI;
	
	public static let systemPreferencesPane      = kUTTypeSystemPreferencesPane      as UTI;
	
	public static let gnuZipArchive              = kUTTypeGNUZipArchive              as UTI;
	public static let bzip2Archive               = kUTTypeBzip2Archive               as UTI;
	public static let zipArchive                 = kUTTypeZipArchive                 as UTI;
	
	public static let spreadsheet                = kUTTypeSpreadsheet                as UTI;
	public static let presentation               = kUTTypePresentation               as UTI;
	public static let database                   = kUTTypeDatabase                   as UTI;
	
	public static let vCard                      = kUTTypeVCard                      as UTI;
	public static let toDoItem                   = kUTTypeToDoItem                   as UTI;
	public static let calendarEvent              = kUTTypeCalendarEvent              as UTI;
	public static let emailMessage               = kUTTypeEmailMessage               as UTI;
	
	public static let internetLocation           = kUTTypeInternetLocation           as UTI;
	
	public static let inkText                    = kUTTypeInkText                    as UTI;
	public static let font                       = kUTTypeFont                       as UTI;
	public static let bookmark                   = kUTTypeBookmark                   as UTI;
	public static let threeDimensionalContent    = kUTType3DContent                  as UTI;
	public static let pkcs12                     = kUTTypePKCS12                     as UTI;
	public static let x509Certificate            = kUTTypeX509Certificate            as UTI;
	public static let electronicPublication      = kUTTypeElectronicPublication      as UTI;
	public static let log                        = kUTTypeLog                        as UTI;
}
