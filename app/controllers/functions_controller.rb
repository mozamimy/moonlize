class FunctionsController < ApplicationController
  def index
    @lambda_functions = LambdaFunction.all
  end
end
