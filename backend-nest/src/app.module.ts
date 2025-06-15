import { Module } from '@nestjs/common';
import { DatabaseModule } from './database/database.module';
import { ProductNatModule } from './product-nat/product-nat.module';
import { ProductIntModule } from './product-int/product-int.module';

@Module({
  imports: [DatabaseModule, ProductNatModule, ProductIntModule],
})
export class AppModule {}
