#!/usr/bin/node
exports.nbOccurences = function (list, searchElement) {
  // Start Initialize a counter for occurrences
  let count = 0;

  // Loop through array and count occurrences of searchElement
  for (let i = 0; i < list.length; i++) {
    if (list[i] === searchElement) {
      count++;
    }
  }

  // Return count of occurrences
  return count;
};
