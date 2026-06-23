# frozen_string_literal: true

SimpleCov.start do
  formatter SimpleCov::Formatter::SimpleFormatter
  add_filter "/test/"
  track_files "lib/**/*.rb"

  # The HTTP request path can't run without a live API, so the connection/request
  # plumbing is excluded from coverage until there are resource methods to exercise.
  add_filter "lib/vehiclesdb/client.rb"

  enable_coverage :branch
  minimum_coverage line: 90, branch: 70
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  puts "\n#{"=" * 60}"
  puts "COVERAGE SUMMARY"
  puts "=" * 60
  puts "Line Coverage:   #{SimpleCov.result.covered_percent.round(2)}%"
  branch_coverage = SimpleCov.result.coverage_statistics[:branch]&.percent&.round(2) || "N/A"
  puts "Branch Coverage: #{branch_coverage}%"
  puts "=" * 60
end
