import {
  IsString,
  IsBoolean,
  IsNumberString,
  IsArray,
  IsObject,
} from 'class-validator';

export class CreateProductInterDto {
  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsNumberString()
  price: string;

  @IsNumberString()
  discountValue: string;

  @IsBoolean()
  hasDiscount: boolean;

  @IsArray()
  gallery: string[];

  @IsObject()
  details: Record<string, any>;
}
