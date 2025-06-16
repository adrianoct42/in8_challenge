import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateProductNationalDto } from './dto/create-product-nat.dto';
import axios from 'axios';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProductNatService {
  constructor(private prisma: PrismaService) {}

  async getNatProducts(): Promise<CreateProductNationalDto> {
    try {
      const response = await axios.get<CreateProductNationalDto>(
        'https://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider',
      );
      return response.data;
    } catch (error) {
      throw new Error(`Erro ao buscar os dados da API. Detalhes: ${error}`);
    }
  }

  async getNatPurchased() {
    return this.prisma.productNational.findMany();
  }

  async addCart(dto: CreateProductNationalDto) {
    return this.prisma.productNational.create({
      data: {
        nome: dto.nome,
        descricao: dto.descricao,
        categoria: dto.categoria,
        imagem: dto.imagem,
        preco: new Prisma.Decimal(dto.preco),
        material: dto.material,
        departamento: dto.departamento,
      },
    });
  }
}
