const selectLocation = (city, job) => {
  type: 'SWITCH_LOCATION',
  city,
  job
};

export default selectLocation;