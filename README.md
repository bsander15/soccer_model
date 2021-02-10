# soccer_model
This model utilizes a Poisson regression to predict a teams scoring rate for a match given their average adjusted score (from FiveThirtyEight) for the season,
thier oppenents average adjusted score allowed (measure of defense), time of possesion, form (average adjusted score from past three games, and opponent form. The rates which are obtained from the regression are then used in a Poisson distribution to calculate This model is currently tailored to the Premier League, but can be adjusted to fit any league which FiveThirtyEight provides data for. This model is unable to adjust for injuries or game-to-game lineup changes, I would like to incorporate parameters which would allow for this model to account for those adjustments but haven't found data suitable for the regression.
