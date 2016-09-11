class FunctionsController < ApplicationController
  def index
    lambda_client = Aws::Lambda::Client.new
    @lambda_response = lambda_client.list_functions
    @functions = @lambda_response.functions
  end
end
