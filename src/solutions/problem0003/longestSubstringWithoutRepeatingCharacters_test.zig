const std = @import("std");
const lengthOfLongestSubstring = @import("./longestSubstringWithoutRepeatingCharacters.zig").lengthOfLongestSubstring;

const Case = struct {
    s: []const u8,
    expected: i32,
};

test "3.无重复字符的最长子串" {
    const cases: [3]Case = .{
        .{
            .s = "abcabcbb",
            .expected = 3,
        },
        .{
            .s = "bbbbb",
            .expected = 1,
        },
        .{
            .s = "pwwkew",
            .expected = 3,
        },
    };

    for (cases) |c| {
        try std.testing.expectEqual(
            c.expected,
            lengthOfLongestSubstring(c.s),
        );
    }
}
