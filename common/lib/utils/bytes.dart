part of 'utils.dart';

class Bytes {
  Bytes();

  /// Returns a hash code for {@code value}; equal to the result of invoking {@code ((Byte)
  /// value).hashCode()}.
  ///
  /// <p><b>Java 8 users:</b> use {@link Byte#hashCode(byte)} instead.
  ///
  /// @param value a primitive {@code byte} value
  /// @return a hash code for the value
  static int hashCodeForByte(int value) {
    return value;
  }

  /// Returns {@code true} if {@code target} is present as an element anywhere in {@code array}.
  ///
  /// @param array an array of {@code byte} values, possibly empty
  /// @param target a primitive {@code byte} value
  /// @return {@code true} if {@code array[i] == target} for some value of {@code i}
  static bool contains(List<int> array, int target) {
    for (var value in array) {
      if (value == target) {
        return true;
      }
    }
    return false;
  }

  /// Returns the index of the first appearance of the value {@code target} in {@code array}.
  ///
  /// @param array an array of {@code byte} values, possibly empty
  /// @param target a primitive {@code byte} value
  /// @return the least index {@code i} for which {@code array[i] == target}, or {@code -1} if no
  ///     such index exists.
  static int indexOf(List<int> array, int target) {
    return indexOfForEnd(array, target, 0, array.length);
  }

  static int indexOfForEnd(List<int> array, int target, int start, int end) {
    for (var i = start; i < end; i++) {
      if (array[i] == target) {
        return i;
      }
    }
    return -1;
  }

  /// Returns the start position of the first occurrence of the specified {@code target} within
  /// {@code array}, or {@code -1} if there is no such occurrence.
  ///
  /// <p>More formally, returns the lowest index {@code i} such that {@code Arrays.copyOfRange(array,
  /// i, i + target.length)} contains exactly the same elements as {@code target}.
  ///
  /// @param array the array to search for the sequence {@code target}
  /// @param target the array to search for as a sub-sequence of {@code array}
  static int indexOfList(List<int> array, List<int> target) {
    checkNotNull(array, 'array');
    checkNotNull(target, 'target');
    if (target.isEmpty) {
      return 0;
    }

    outer:
    for (var i = 0; i < array.length - target.length + 1; i++) {
      for (var j = 0; j < target.length; j++) {
        if (array[i + j] != target[j]) {
          continue outer;
        }
      }
      return i;
    }
    return -1;
  }

  /// Returns the index of the last appearance of the value {@code target} in {@code array}.
  ///
  /// @param array an array of {@code byte} values, possibly empty
  /// @param target a primitive {@code byte} value
  /// @return the greatest index {@code i} for which {@code array[i] == target}, or {@code -1} if no
  ///     such index exists.
  static int lastIndexOf(List<int> array, int target) {
    return lastIndexOfForEnd(array, target, 0, array.length);
  }

  static int lastIndexOfForEnd(List<int> array, int target, int start, int end) {
    for (var i = end - 1; i >= start; i--) {
      if (array[i] == target) {
        return i;
      }
    }
    return -1;
  }

  /// Returns the values from each provided array combined into a single array. For example, {@code
  /// concat(new List<int> {a, b}, new List<int> {}, new List<int> {c}} returns the array {@code {a, b, c}}.
  ///
  /// @param arrays zero or more {@code byte} arrays
  /// @return a single array containing all the values from the source arrays, in order
  static List<int> concat(List<List<int>> arrays) {
    var result = <int>[];
    for (var array in arrays) {
      result = [...array];
    }
    return result;
  }

  /// Returns an array containing the same values as {@code array}, but guaranteed to be of a
  /// specified minimum length. If {@code array} already has a length of at least {@code minLength},
  /// it is returned directly. Otherwise, a new array of size {@code minLength + padding} is
  /// returned, containing the values of {@code array}, and zeroes in the remaining places.
  ///
  /// @param array the source array
  /// @param minLength the minimum length the returned array must guarantee
  /// @param padding an extra amount to "grow" the array by if growth is necessary
  /// @throws IllegalArgumentException if {@code minLength} or {@code padding} is negative
  /// @return an array containing the values of {@code array}, with guaranteed minimum length {@code
  ///     minLength}
  static List<int> ensureCapacity(List<int> array, int minLength, int padding) {
    checkArgument(minLength >= 0, 'Invalid minLength: $minLength', '');
    checkArgument(padding >= 0, 'Invalid padding: $padding', '');
    return (array.length < minLength) ? array : array;
  }

  /// Returns an array containing each value of {@code collection}, converted to a {@code byte} value
  /// in the manner of {@link Number#byteValue}.
  ///
  /// <p>Elements are copied from the argument collection as if by {@code collection.toArray()}.
  /// Calling this method is as thread-safe as calling that method.
  ///
  /// @param collection a collection of {@code Number} instances
  /// @return an array containing the same values as {@code collection}, in the same order, converted
  ///     to primitives
  /// @throws NullPointerException if {@code collection} or any of its elements is null
  /// @since 1.0 (parameter was {@code Collection<Byte>} before 12.0)
  static List<int> toArray(List<int> array) {
    return array;
  }

  /// Returns a fixed-size list backed by the specified array, similar to {@link
  /// Arrays#asList(Object[])}. The list supports {@link List#set(int, Object)}, but any attempt to
  /// set a value to {@code null} will result in a {@link NullPointerException}.
  ///
  /// <p>The returned list maintains the values, but not the identities, of {@code Byte} objects
  /// written to or read from it. For example, whether {@code list.get(0) == list.get(0)} is true for
  /// the returned list is unspecified.
  ///
  /// @param backingArray the array to back the list
  /// @return a list view of the array
  static List<int> asList(List<int> backingArray) {
    return backingArray;
  }

  /// Reverses the elements of {@code array}. This is equivalent to {@code
  /// Collections.reverse(Bytes.asList(array))}, but is likely to be more efficient.
  ///
  /// @since 23.1
  static void reverse(List<int> array) {
    checkNotNull(array);
    reverseForIndex(array, 0, array.length);
  }

  /// Reverses the elements of {@code array} between {@code fromIndex} inclusive and {@code toIndex}
  /// exclusive. This is equivalent to {@code
  /// Collections.reverse(Bytes.asList(array).subList(fromIndex, toIndex))}, but is likely to be more
  /// efficient.
  ///
  /// @throws IndexOutOfBoundsException if {@code fromIndex < 0}, {@code toIndex > array.length}, or
  ///     {@code toIndex > fromIndex}
  /// @since 23.1
  static void reverseForIndex(List<int> array, int fromIndex, int toIndex) {
    checkNotNull(array);
    checkPositionIndexes(fromIndex, toIndex, array.length);
    for (var i = fromIndex, j = toIndex - 1; i < j; i++, j--) {
      var tmp = array[i];
      array[i] = array[j];
      array[j] = tmp;
    }
  }

  static bool startsWith(List<int> list, List<int> prefix) {
    return list.length >= prefix.length && list.sublist(0, prefix.length) == (prefix);
  }

  static bool endsWith(final List<int> list, List<int> suffix) {
    return list.length >= suffix.length && list.sublist(list.length - suffix.length) == (suffix);
  }
}

T checkNotNull<T>(T reference, [String message]) {
  if (reference == null) {
    throw 'NullPointerException: $message';
  }
  return reference;
}

void checkPositionIndexes(int start, int end, int size) {
  // Carefully optimized for execution by hotspot (explanatory comment above)
  if (start < 0 || end < start || end > size) {
    throw (_badPositionIndexes(start, end, size));
  }
}

String _badPositionIndexes(int start, int end, int size) {
  if (start < 0 || start > size) {
    return _badPositionIndex(start, size, 'start index');
  }
  if (end < 0 || end > size) {
    return _badPositionIndex(end, size, 'end index');
  }
  // end < start
  return ('end index ($end) must not be less than start index ($start)');
}

String _badPositionIndex(int index, int size, String desc) {
  if (index < 0) {
    return ('$desc ($index) must not be negative');
  } else if (size < 0) {
    throw ('negative size: $size');
  } else {
    // index > size
    return ('$desc ($index) must not be greater than size ($size)');
  }
}
