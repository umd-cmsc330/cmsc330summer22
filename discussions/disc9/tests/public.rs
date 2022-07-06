use disc9::*;

#[test]
fn public_sum_evens() {
    assert_eq!(20, sum_evens(1, 10));
    assert_eq!(2450, sum_evens(1, 100));
    assert_eq!(0, sum_evens(0, 2));
}
#[test]
fn public_distance() {
    assert_eq!(5., distance((1., 1.), (4., 5.)));
    assert_eq!(10., distance((6., 8.), (12., 16.)));
}
#[test]
fn public_raise_1() {
    let mut a = [1, 2, 3];
    let mut b = [10, 20, 30];
    raise_1(&mut a);
    raise_1(&mut b);
    assert_eq!([2, 3, 4], a);
    assert_eq!([11, 21, 31], b);
}
#[test]
fn public_add_hello() {
    let mut a = String::from("World");
    add_hello(&mut a);
    assert_eq!("Worldhello", a);
}
#[test]
fn public_create_hello_world() {
    let a = create_hello_world();
    assert_eq!("helloworld", a)
}
#[test]
fn public_get_first_elem() {
    let a = vec![1, 2, 3];
    let b = vec![100, 200, 300];
    let res1 = get_first_elem(&a);
    let res2 = get_first_elem(&b);

    assert_eq!(1, res1);
    assert_eq!(100, res2)
}
