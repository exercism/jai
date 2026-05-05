run_tests :: () {
    encode_yes();
    skip(encode_no());
    skip(encode_o_m_g());
    skip(encode_spaces());
    skip(encode_mindblowingly());
    skip(encode_numbers());
    skip(encode_deep_thought());
    skip(encode_all_the_letters());
    skip(decode_exercism());
    skip(decode_a_sentence());
    skip(decode_numbers());
    skip(decode_all_the_letters());
    skip(decode_with_too_many_spaces());
    skip(decode_with_no_spaces());
}

encode_yes :: () {
    assert_equal("bvh", encode("yes"));
}

encode_no :: () {
    assert_equal("ml", encode("no"));
}

encode_o_m_g :: () {
    assert_equal("lnt", encode("OMG"));
}

encode_spaces :: () {
    assert_equal("lnt", encode("O M G"));
}

encode_mindblowingly :: () {
    assert_equal("nrmwy oldrm tob", encode("mindblowingly"));
}

encode_numbers :: () {
    assert_equal("gvhgr mt123 gvhgr mt", encode("Testing,1 2 3, testing."));
}

encode_deep_thought :: () {
    assert_equal("gifgs rhurx grlm", encode("Truth is fiction."));
}

encode_all_the_letters :: () {
    assert_equal("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", encode("The quick brown fox jumps over the lazy dog."));
}

decode_exercism :: () {
    assert_equal("exercism", decode("vcvix rhn"));
}

decode_a_sentence :: () {
    assert_equal("anobstacleisoftenasteppingstone", decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"));
}

decode_numbers :: () {
    assert_equal("testing123testing", decode("gvhgr mt123 gvhgr mt"));
}

decode_all_the_letters :: () {
    assert_equal("thequickbrownfoxjumpsoverthelazydog", decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"));
}

decode_with_too_many_spaces :: () {
    assert_equal("exercism", decode("vc vix    r hn"));
}

decode_with_no_spaces :: () {
    assert_equal("anobstacleisoftenasteppingstone", decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"));
}

#run {
    before_running_tests();
    run_tests();
    after_running_tests();
}

#load "solution.jai";
#load "extest.jai";
