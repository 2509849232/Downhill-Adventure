var _curveStruct = animcurve_get(curveAsset);
var _channel = animcurve_get_channel(_curveStruct, "y");

var _value = animcurve_channel_evaluate(_channel,curvePosition);

y = ystart + _value;

curvePosition += curveSpeed;

if (curvePosition >= 1) curvePosition = 0;