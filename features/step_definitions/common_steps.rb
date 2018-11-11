Before do
  @log = Logger.new(STDOUT)
  @log.datetime_format = "%H:%M:%S"
  if ENV['LOG_LEVEL'] == 'debug'
    @log.level = Logger::DEBUG
  elsif ENV['LOG_LEVEL'] == 'info'
    @log.level = Logger::INFO
  else
    # default log level
    @log.level = Logger::WARN
  end
  @path_to_results = "test_data/out"
  @path_to_testdata = "test_data/in"
end

Given("a feature dir {string}") do |string|
  @path_to_testdata = "#{@path_to_testdata}/#{string}"
end

When("the mapper is called") do
  @mapper = Featuremap.new(@path_to_testdata)
  create_path(@path_to_results)
  @featuremap_file = "#{@path_to_results}/featuremap.mm"
  @mapper.create_featuremap(@featuremap_file)
end
