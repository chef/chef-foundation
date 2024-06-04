# frozen_string_literal: true
require 'minitest/autorun'
require 'openssl'

class FipsTest < Minitest::Test
  def test_sha256
    sha256 = OpenSSL::Digest.new('SHA256')
    sha256 << 'test'

    # just invoke the digest method to make sure it doesn't crash
    sha256.digest
  end

  def make_md5
    md5 = OpenSSL::Digest.new('MD5')
    md5 << 'test'
    md5.digest
  end
  def test_md5
    if ENV['OMNIBUS_FIPS_MODE'].to_s.casecmp('true').zero?
      # this will raise an exception if FIPS mode support not available
      OpenSSL.fips_mode = true

      assert_raises OpenSSL::Digest::DigestError do
        make_md5
      end
    end

    OpenSSL.fips_mode = false
    # if md5 raises an exception with FIPS off, then something's wrong
    make_md5
  end
end
