import uncurl
import numpy as np


def uncurl_cluster(data, k=0, **params):
    """
    data is an array of shape genes x cells
    """
    # TODO: gene subset selection???
    if k is None:
        k = 0
    m, w, ll = uncurl.run_state_estimation(data, k)
    return np.argmax(w, 1)
