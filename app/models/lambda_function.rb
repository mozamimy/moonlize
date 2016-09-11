class LambdaFunction
  def self.all
    lambda_response.functions.map { |f| LambdaFunction.new(f) }
  end

  def initialize(raw_lambda_function)
    @resource = raw_lambda_function
  end

  def method_missing(name, *args)
    @resource.send(name, *args)
  end

  private

  def self.lambda_client
    return @lambda_client if @lambda_client
    @lambda_client = Aws::Lambda::Client.new
  end

  def self.lambda_response
    return @lambda_response if @lambda_response
    @function_list_response = lambda_client.list_functions
  end

  def self.reload
    @function_list_response = lambda_client.list_functions
  end
end
