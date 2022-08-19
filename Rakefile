require 'rubygems'
require 'bundler'


begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.warn e.message
  $stderr.warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end


require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task default: :test

task :add, :sld, :tld, :name do |_t, args|
  file_path = "#{File.expand_path(__FILE__ + '/..')}/lib/domains/#{args.tld}/#{args.sld}"
  if File.exist?(file_path)
    puts 'already exists'
    return
  end

  begin
    FileUtils.mkdir_p(File.dirname(file_path))
    File.open(file_path, 'w') do |contents|
      contents.print args.name
    end
    `git add #{file_path}`
    `git commit -m "Add #{args.name}"`
    puts 'commit successful'
  rescue StandardError
    puts 'commit failed'
  end
end

task :quackit_import do
  require 'nokogiri'
  require 'open-uri'
  require_relative File.join('lib', 'swot', 'academic_tlds')

  new_domains = Set.new
  doc = Nokogiri::HTML(URI.open('http://www.quackit.com/domain-names/country_domain_extensions.cfm'))
  doc.css('#content li').each do |li|
    desc = li.content.split(/\s+-\s+/, 2)[1]
    next unless desc =~ /academic|education|school/i

    domain_el = li.at_css('b')
    # some lines have more than one domain listed
    domains = domain_el.content.split(%r{\s*/\s*})
    domains.each do |domain|
      # remove leading space
      domain = domain.strip.sub(/\A\./, '')
      next if Swot::ACADEMIC_TLDS.include?(domain)

      # print out for manual review
      puts "#{domain} - #{desc.strip.gsub(/\s+/, ' ')}"
      new_domains << domain
    end
  end

  puts "\nNEW DOMAINS (#{new_domains.size}):\n\n"

  new_domains.each do |domain|
    puts domain
  end
end
