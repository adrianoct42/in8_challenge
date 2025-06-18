import 'package:dio/dio.dart';
import 'package:frontend_flutter/models/intprod_dto.dart';
import 'package:frontend_flutter/models/natprod_dto.dart';

class ProductService {
  final Dio _dio;

  ProductService(String baseUrl)
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<List<NatProdDto>> getNacionais() async {
    try {
      final response = await _dio.get('/product-nat/all');
      final data = response.data as List;
      return data.map((item) => NatProdDto.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos nacionais.');
    }
  }

  Future<List<IntProdDto>> getInternacionais() async {
    try {
      final response = await _dio.get('/product-int/all');
      final data = response.data as List;
      return data.map((item) => IntProdDto.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos internacionais.');
    }
  }

  Future<void> addNacional(NatProdDto produto) async {
    try {
      await _dio.post('/product-nat/add-cart', data: produto.toJson());
    } catch (e) {
      throw Exception('Erro ao adicionar produto nacional.');
    }
  }

  Future<void> addInternacional(IntProdDto produto) async {
    try {
      await _dio.post('/product-int/add-cart', data: produto.toJson());
    } catch (e) {
      throw Exception('Erro ao adicionar produto internacional.');
    }
  }
}
