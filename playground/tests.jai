TestOutcome :: enum u8 {
    PASSED;
    FAILED;
}

Test :: struct {
    name: string;
    outcome: TestOutcome;
};

#add_context tests: [..] Test;

assert_eq :: (a: Code, b: Code) #expand {
    sa := #run code_to_string(a);
    va := #insert a;
  
  sb := #run code_to_string(b);
  vb := #insert b;
  assert(va == vb, 
    "(left == right)\n  left: %  expr: %\n  right: %  expr: %\n  loc: %\n",
    va, sa, vb, sb,
    #location(a));
}

main :: () {
    print("context.tests: %\n", context.tests);
    array_add(*context.tests, Test.{name ="test 1", outcome = .PASSED});
    print("context.tests: %\n", context.tests);
}

#import "Basic";
