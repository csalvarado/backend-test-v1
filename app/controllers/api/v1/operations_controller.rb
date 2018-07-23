module Api
  module V1
    class OperationsController < ApplicationController

      def index
        #Esta función se puede eliminar, utilizada en el desarrollo para probar
        operations = Operation.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Calculated operations', data:operations},status: :ok
      end

      def create
        operation = Operation.new(operation_params)
        #calculo la operacion recibida
        operacion = operation.operador
        num1 = operation.numero1.to_f
        num2 = operation.numero2.to_f
        operation.resultado = calcular(operacion,num1,num2)
        #devuelvo el calculo()
        if operation.save
          render json: {message:'Succesfully calculated', resultado:operation.resultado },status: :ok
        else
          render json: {message:'Not calculated'},status: :unprocessable_entity
        end
      end

      def calcular(operacion , num1 , num2)
        if operacion == '+'
          result = num1 + num2
          return result.to_f
        end
        if operacion == '-'
          result = num1 - num2
          return result.to_f
        end
        if operacion == '*'
          result = num1 * num2
          return result.to_f
        end
        if operacion == '/'
          result = num1 / num2
          return result.to_f
        end
      end

      private

      def operation_params
        params.permit(:numero1, :operador, :numero2)
      end
    end
  end
end
