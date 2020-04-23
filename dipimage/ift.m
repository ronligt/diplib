%IFT   Fourier transform (inverse)
%
% SYNOPSIS:
%  image_out = ift(image_in,options,process)
%
%  OPTIONS is a cell array with strings specifying how the transform should
%  be applied. These are the possible values:
%   - 'real': assumes that the (complex) input is conjugate symmetric, and
%     returns a real-valued result.
%   - 'fast': pads the input to a "nice" size, multiple of 2, 3 and 5, which
%     can be processed faster. Note that 'fast' causes the output to be
%     interpolated. This is not always a problem when computing convolutions
%     or correlations, but will introduce e.g. edge effects in the result of
%     the convolution.
%   - 'corner': sets the origin to the top-left corner of the image (both in
%     the spatial and the frequency domain). This yields a standard DFT
%     (Discrete Fourier Transform).
%   - 'symmetric': the normalization is made symmetric, where both forward and
%     inverse transforms are normalized by the same amount. Each transform is
%     multiplied by `1/sqrt(size)` for each dimension. This makes the transform
%     identical to how it was in versions of *DIPimage* prior to version 3.0.
%
%  PROCESS is an array specifying over which dimensions the transform should be
%  computed. The empty array indicates that all dimensions should be processed.
%
% DEFAULTS:
%  options = {}
%  process = [] (equivalent to all dimensions)
%
% NOTES:
%  This function calls FT adding the string 'inverse' to the options.
%
%  The 'FtOption' preference (see DIPSETPREF) defines one option that will be
%  added to the OPTIONS array. With
%     dipsetpref('FtOption','symmetric')
%  you ensure that all subsequent calls to FT and IFT will use the symmetric
%  normalization, and therefore behave like in DIPimage 2.
%
% SEE ALSO:
%  ft, convolve
%
% DIPlib:
%  This function calls the DIPlib function dip::FourierTransform.

% (c)2017-2020, Cris Luengo.
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

function out = ift(in,options,varargin)
if(nargin<2)
   options = {};
elseif ~iscell(options)
   options= {options};
end
options = [dipgetpref('FtOption'),options,{'inverse'}];
% dirty trick: if `dipgetpref` returns an empty string, then ['',options] == options
%              otherwise ['foo',options] == [{'foo'},options]
out = dip_filtering('ft',in,options,varargin{:});
