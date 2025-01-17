%RIESZ   Riesz transform
%
% SYNOPSIS:
%  image_out = riesz(image_in)
%
%  IMAGE_IN is a scalar image with N dimensions.
%  IMAGE_OUT is a vector image with N components.
%
% DIPlib:
%  This function calls the DIPlib function <a href="https://diplib.org/diplib-docs/transform.html#dip-RieszTransform-Image-CL-Image-L-String-CL-String-CL-BooleanArray-">dip::RieszTransform</a>.

% (c)2018, Cris Luengo.
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

function out = riesz(varargin)
out = dip_filtering('riesz',varargin{:});
