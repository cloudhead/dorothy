require 'toto'

@config = Toto::Config::Defaults

desc "Run 'rake new[\"My Article Title\"]' to create a new article."
task :new, [:title] do |t, args|
  if args.title.nil?
    toto "Please provide an article title with 'rake new[\"My Article Title\"]'"
    exit
  end
  title = args.title.strip.downcase.gsub(/ /, '-')
  article = {'title' => title, 'date' => Time.now.strftime("%d/%m/%Y"), 'author' => @config[:author]}.to_yaml
  article << "\n"
  article << "Once upon a time...\n\n"

  path = "#{Toto::Paths[:articles]}/#{Time.now.strftime("%Y-%m-%d")}-#{title}.#{@config[:ext]}"

  unless File.exist? path
    File.open(path, "w") do |file|
      file.write article
    end
    toto "an article was created for you at #{path}."
  else
    toto "I can't create the article, #{path} already exists."
  end
end

desc "Publish my blog."
task :publish do
  toto "publishing your article(s)..."
  `git push heroku master`
end

def toto msg
  puts "\n  toto ~ #{msg}\n\n"
end

