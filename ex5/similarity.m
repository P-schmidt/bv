function [time, sim, match] = similarity(Data, Im, test)
    tic
    Im = repmat(Im, 1, size(Data, 2));
    [sims, idx] = sort(dot(Im, Data), 'descend');
    % get 2nd best match if Im is in the data
    if test
        sim = sims(2);
        match = idx(2);
    else
        sim = sims(1);
        match = idx(1);
    end
    time = toc;
end