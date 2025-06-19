import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      throw Exception('Erro ao buscar produtos nacionais. $e');
    }
  }

  Future<List<IntProdDto>> getInternacionais() async {
    try {
      final response = await _dio.get('/product-int/all');
      final data = response.data as List;
      return data.map((item) => IntProdDto.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos internacionais. $e');
    }
  }

  Future<List<dynamic>> getProdutosComprados() async {
    try {
      final nacionalResponse = await _dio.get('/product-nat/purchased-nat');
      final internacionalResponse =
          await _dio.get('/product-int/purchased-int');
      final List<dynamic> nacional = nacionalResponse.data as List<dynamic>;
      final List<dynamic> internacional =
          internacionalResponse.data as List<dynamic>;
      final List<dynamic> unificado = [...nacional, ...internacional];
      return unificado;
    } catch (e) {
      if (e is DioException) {
        debugPrint('Erro: ${e.response?.statusCode}');
        debugPrint('Corpo do erro: ${e.response?.data}');
      }
      throw Exception('Erro ao buscar produtos comprados. $e');
    }
  }

  Future<void> addNacional(NatProdDto produto) async {
    try {
      await _dio.post(
        '/product-nat/add-cart',
        data: produto.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (e) {
      if (e is DioException) {
        debugPrint('Erro: ${e.response?.statusCode}');
        debugPrint('Corpo do erro: ${e.response?.data}');
      }
      throw Exception('Erro ao adicionar produto nacional. $e');
    }
  }

  Future<void> addInternacional(IntProdDto produto) async {
    try {
      await _dio.post(
        '/product-int/add-cart',
        data: produto.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch (e) {
      if (e is DioException) {
        debugPrint('Erro: ${e.response?.statusCode}');
        debugPrint('Corpo do erro: ${e.response?.data}');
      }
      throw Exception('Erro ao adicionar produto nacional. $e');
    }
  }
}
