%GRADMAG   Gradient magnitude
%
% SYNOPSIS:
%  image_out = gradmag(image_in,sigma,method,boundary_condition,dim,truncation)
%
% DEFAULTS:
%  sigma = 1
%
%  IMAGE_IN is a scalar image with N dimensions.
%
%  DIM determines along which dimensions to take the derivative.
%  It must be an array of integers in the range 1 to NDIMS(IMAGE_IN).
%  The empty array indicates that all dimensions should be processed.
%  For the N-dimensional image above, if DIM==1, then only the derivative
%  along the first dimension is computed.
%
%  See DERIVATIVE for a description of the parameters and the defaults.
%
% DIPlib:
%  This function calls the DIPlib function <a href="https://diplib.org/diplib-docs/linear.html#dip-GradientMagnitude-Image-CL-Image-L-FloatArray--String-CL-StringArray-CL-BooleanArray--dfloat-">dip::GradientMagnitude</a>.

% (c)2017-2018, Cris Luengo.
% Based on original DIPlib code: (c)1995-2014, Delft University of Technology.
% Based on original DIPimage code: (c)1999-2014, Delft University of Technology.
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

function out = gradmag(varargin)
out = dip_filtering('gradmag',varargin{:});
