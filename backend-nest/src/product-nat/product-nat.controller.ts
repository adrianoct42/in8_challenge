import { Body, Controller, Get, Post } from '@nestjs/common';
import { ProductNatService } from './product-nat.service';
import { CreateProductNationalDto } from './dto/create-product-nat.dto';
import { ProductNational } from '@prisma/client';

@Controller('product-nat')
export class ProductNatController {
  constructor(private readonly productNatService: ProductNatService) {}

  @Get('purchased-nat')
  async getNatPurchased() {
    return this.productNatService.getNatPurchased();
  }

  @Get('all')
  async getNatProducts() {
    return this.productNatService.getNatProducts();
  }

  @Post('add-cart')
  async addCart(
    @Body() dto: CreateProductNationalDto,
  ): Promise<ProductNational> {
    return this.productNatService.addCart(dto);
  }
}
