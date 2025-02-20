import 'package:senior/data/core/repository/api_client.dart';
import 'package:senior/data/core/repository/exceptions_network.dart';

class PostServices {
  Future<bool> postHours(data) async {
    try {
      final response = await dio.post('postHours', data: {'data': data});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      ErrorNotifier.showError(
          'Erro ao fazer a requisição na API: ${error.toString()}');
      return false;
    }
  }

  Future<bool> postSendEmail(data) async {
    try {
      final response = await dio.post('postSendEmail', data: {'data': data});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Erro ao fazer a requisição na API: $error');
      return false;
    }
  }
}

class GetServices {
  Future<List<Map<String, dynamic>>> getCollaborators() async {
    try {
      final response = await dio.get('getColaboradorGestor');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
            response.data['getColaboradorGestor']);
      } else {
        ErrorNotifier.showError(
            'Erro ao fazer busca de colaboradores: ${response.statusMessage}');
        return [];
      }
    } catch (error) {
      ErrorNotifier.showError('Erro ao carregar API: ${error.toString()}');
      return [];
    }
  }

  Future<Map<String, dynamic>> getLogin() async {
    try {
      final response = await dio.get('getLogin');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return {};
      }
    } catch (error) {
      print('Erro ao fazer a consulta na API: $error');
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> getCiclo() async {
    try {
      final response = await dio.get('getCiclo');

      if (response.data != null && response.data['getCiclo'] != null) {
        return List<Map<String, dynamic>>.from(response.data['getCiclo']);
      } else {
        ErrorNotifier.showError(
            'Erro ao fazer busca ciclo: ${response.statusMessage}');
        return [];
      }
    } catch (error) {
      print('Erro ao fazer a consulta na API: $error');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getSafra() async {
    try {
      final response = await dio.get('getSafra');

      if (response.data != null && response.data['getSafra'] != null) {
        return List<Map<String, dynamic>>.from(response.data['getSafra']);
      } else {
        ErrorNotifier.showError(
            'Erro ao fazer busca de safra: ${response.statusMessage}');
        return [];
      }
    } catch (error) {
      print('Erro ao fazer a consulta na API: $error');
      return [];
    }
  }
}
