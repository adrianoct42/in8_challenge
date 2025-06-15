import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';
import { CreateProductInterDto } from './dto/create-product-int-dto';
import axios from 'axios';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProductIntService {
  constructor(private prisma: PrismaService) {}

  async getIntProducts(): Promise<CreateProductInterDto> {
    try {
      const response = await axios.get<CreateProductInterDto>(
        'https://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider',
      );
      return response.data;
    } catch (error) {
      throw new Error(
        `Erro ao buscar os dados da API europeia. Detalhes: ${error}`,
      );
    }
  }

  async addCart(dto: CreateProductInterDto) {
    return this.prisma.productInter.create({
      data: {
        name: dto.name,
        description: dto.description,
        price: new Prisma.Decimal(dto.price),
        discountValue: new Prisma.Decimal(dto.discountValue),
        hasDiscount: dto.hasDiscount,
        gallery: dto.gallery,
        details: dto.details,
      },
    });
  }
}
