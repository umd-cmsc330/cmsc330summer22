require "minitest/autorun"

#
# Expected
#

EXPECTED =
  {"test_public_graphviz"=>{:assertions=>1},
   "test_public_opam"=>{:assertions=>2},
   "test_public_ocaml"=>{:assertions=>2},
   "test_public_ocaml_pkgs"=>{:assertions=>3},
   "test_public_ruby_gems"=>{:assertions=>3},
   "test_public_sqlite3"=>{:assertions=>1}}

TAMPER = "Tests were tampered, please revert your copy of public.rb"

#
# Required packages
#

class SemiPublicTests < Minitest::Test
  def test_validate
      if not File.exists?("src/p0.report") then
      flunk "Please run the tests locally before you submit."
    end
    file = File.open("src/p0.report", "rb")
    contents = file.read
    results = Marshal.load(contents)
    results.each do |r|
      r_expected = EXPECTED[r[:name]]
      assert_empty(r[:failures])
      r_expected.each do |k,v|
        assert_equal(r[k], v, msg = TAMPER)
      end
    end
  end
end
