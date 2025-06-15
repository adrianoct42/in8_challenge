import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { ProductIntController } from './product-int.controller';
import { ProductIntService } from './product-int.service';

@Module({
  imports: [DatabaseModule],
  controllers: [ProductIntController],
  providers: [ProductIntService],
})
export class ProductIntModule {}
