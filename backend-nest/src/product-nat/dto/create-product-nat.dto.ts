import { IsString, IsNumberString } from 'class-validator';

export class CreateProductNationalDto {
  @IsString()
  nome: string;

  @IsString()
  descricao: string;

  @IsString()
  categoria: string;

  @IsString()
  imagem: string;

  @IsNumberString()
  preco: string;

  @IsString()
  material: string;

  @IsString()
  departamento: string;
}
