//
//  Artist.swift
//  veezee
//
//  Created by Vahid Amiri Motlagh on 2/11/18.
//  Copyright © 2018 veezee. All rights reserved.
//

import Foundation

struct Artist: Codable {
	var _id : [String:String]?;
	var id : String?;
	var name : String?;
	
	enum CodingKeys: String, CodingKey {
		case _id
		case id
		case name
	}
	
	init() {
		
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self);
		
		id = try container.decode(._id, transformer: MongodbObjectIdCodableTransformer());
		name = try container.decode(String?.self, forKey: .name);
	}
	
	func encode(to encoder: Encoder) throws {
		var container =  encoder.container(keyedBy: CodingKeys.self);
		
		try container.encode(id ?? "", forKey: ._id, transformer: MongodbObjectIdCodableTransformer());
		try container.encode(self.name, forKey: .name);
	}
}
