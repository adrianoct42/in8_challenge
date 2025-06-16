import { Body, Controller, Get, Post } from '@nestjs/common';
import { ProductIntService } from './product-int.service';
import { CreateProductInterDto } from './dto/create-product-int-dto';
import { ProductInter } from '@prisma/client';

@Controller('product-int')
export class ProductIntController {
  constructor(private readonly productIntService: ProductIntService) {}

  @Get('purchased-int')
  async getIntPurchased() {
    return this.productIntService.getIntPurchased();
  }

  @Get('all')
  async getIntProducts() {
    return this.productIntService.getIntProducts();
  }

  @Post('add-cart')
  async addCart(@Body() dto: CreateProductInterDto): Promise<ProductInter> {
    return this.productIntService.addCart(dto);
  }
}
