require 'read_files'
require 'write_xls'
require 'read_parse_xml'
require 'nokogiri'
require 'axlsx'

# frozen_string_literal: true

# Smart requirer:
current_dir = Dir.pwd
folders = %w[exceptions helpers models utils cron]

folders.each{|folder| Dir["#{current_dir}/lib/#{folder}/*.rb"].each{|file| require file}}