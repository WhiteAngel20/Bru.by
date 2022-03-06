function arearectangle(width, height)
{
    var area = parseInt(width) * parseInt(height);
    console.log(`Area of reactangle with width=${width} and heigth=${height} equally ${area}`);
    return area;
}
function areatriangle(x1, x2, x3){
    x1 = parseFloat(x1);
    x2 = parseFloat(x2);
    x3 = parseFloat(x3);
    
    var semiperimeter = (x1+x2+x3)/2;
    
    x1 = semiperimeter - x1;
    x2 = semiperimeter - x2;
    x3 = semiperimeter - x3;
    
    var area = Math.sqrt(x1*x2*x3);
    console.log(`Area of triangle is ${area}`);
    return area;
}
function distance(points){
    console.log(typeof(points));
    points = points.split(", ");
    x = points[0];
    y = points[1];
    _distance = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
    console.log(`Distance is ${_distance}`);
    alert(_distance);
    return _distance;
}


















