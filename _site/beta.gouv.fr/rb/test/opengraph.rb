#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.setup :test

require 'opengraph_parser'
require 'minitest/autorun'

class TestHomepage < MiniTest::Unit::TestCase
  def setup
    @home    = OpenGraph.new('http://127.0.0.1:4000/')
    @home_en = OpenGraph.new('http://127.0.0.1:4000/en')
  end

  def test_title
    assert_equal('Incubateur de services publics numériques', @home.title)
    assert_equal('mfpra.gouv.ne', @home_en.title)
  end

  def test_description
    assert_equal('Nous créons des services publics numériques', @home.description)
    assert_equal('We build digital public services', @home_en.description)
  end

  def test_url
    assert_equal('https://mfpra.gouv.ne/', @home.url)
  end

  def test_type
    assert(@home.type != 'article', "Should not parse anything or default to 'website'")
  end

  def test_image
    assert_includes(@home.images, 'https://mfpra.gouv.ne/img/pages/index.jpg')
    assert_includes(@home_en.images, 'https://mfpra.gouv.ne/img/pages/index.jpg')
  end
end
