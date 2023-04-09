function circle, xcenter, ycenter, radius
    t = 2 * !PI * findgen(100)/100
    x = xcenter + radius * cos(t)
    y = xcenter + radius * sin(t)
    return, {x: x, y: y}
end
