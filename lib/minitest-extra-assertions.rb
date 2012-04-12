module MiniTest
  module Assertions
    def assert_false obj, msg = nil
      msg = message(msg) { "<false> expected but was #{mu_pp(obj)}" }
      assert obj == false, msg
    end

    def assert_true obj, msg = nil
      msg = message(msg) { "<true> expected but was #{mu_pp(obj)}" }
      assert obj == true, msg
    end

    # This is pull-requested for minitest proper, hopefully will be merged soon
    def assert_match exp, act, msg = nil
      msg = message(msg) { "Expected #{mu_pp(exp)} to match #{mu_pp(act)}" }
      assert_respond_to act, "=~"
      exp = Regexp.new(Regexp.escape(exp)) if String === exp
      assert act =~ exp, msg
    end
  end
end

