class Rectangle {
    num left;
    num top;
    num width;
    num height;

    Rectangle(this.left, this.top, this.width, this.height);
    
    // right 和 bottom 两个属性的计算方法
    num get right => left + width;
    set right(num value) => left = value - width;
    num get bottom => top + height;
    set bottom(num value) => top = value - height;
}

main() {
    var rect = new Rectangle(3, 4, 20, 15);
    print(rect.left == 3);
    rect.right = 12;
    print(rect.left == -8);
}