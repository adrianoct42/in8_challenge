import { Module } from '@nestjs/common';
import { ProductNatController } from './product-nat.controller';
import { ProductNatService } from './product-nat.service';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [ProductNatController],
  providers: [ProductNatService],
  imports: [DatabaseModule],
})
export class ProductNatModule {}
