function [error] = relative_error(original, reconstructed)
error = norm(original-reconstructed) / norm(original);
