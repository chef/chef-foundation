# frozen_string_literal: true

require 'minitest/autorun'
require "openssl"

class OpenSSLTest < Minitest::Test
  def aix?
    RUBY_PLATFORM.include?('aix')
  end

  def solaris?
    RUBY_PLATFORM.include?('solaris')
  end

  def override(*args, **kwargs)
    @overrides ||= {}
    @overrides[args[0]] = kwargs[:version]
  end

  def setup
    eval(File.read(File.join(__dir__.to_s, '../omnibus_overrides.rb')))
  end

  %w(version library_version).each do |method|
    define_method "test_#{method}" do
      assert_match(@overrides['openssl'], OpenSSL.const_get("OPENSSL_#{method.upcase}"))
    end
  end
end
