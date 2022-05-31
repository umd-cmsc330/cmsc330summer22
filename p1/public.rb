#!/usr/local/bin/ruby

require "minitest/autorun"
require_relative "maze.rb"

$MAZE1 = "inputs/maze1"
$MAZE2 = "inputs/maze2"
$MAZE3 = "inputs/maze3"

$MAZE4 = "inputs/maze4"
$MAZE5 = "inputs/maze5"

class PublicTests < Minitest::Test

    def test_public_distance
    	$OUTPUT_MAZE4 = File.read("outputs/public_distance_maze4.out")
    	$OUTPUT_MAZE5 = File.read("outputs/public_distance_maze5.out")

        assert_equal($OUTPUT_MAZE4, main("distance", $MAZE4))
        assert_equal($OUTPUT_MAZE5, main("distance", $MAZE5))
    end

    def test_public_open
        $OUTPUT_MAZE4 = File.read("outputs/public_open_maze4.out")
        $OUTPUT_MAZE5 = File.read("outputs/public_open_maze5.out")

        assert_equal($OUTPUT_MAZE4.to_i, main("open", $MAZE4))
        assert_equal($OUTPUT_MAZE5.to_i, main("open", $MAZE5))
    end

    def test_public_paths
    	$OUTPUT_MAZE4 = File.read("outputs/public_paths_maze4.out")
        $OUTPUT_MAZE5 = File.read("outputs/public_paths_maze5.out")

        assert_equal($OUTPUT_MAZE4, main("paths", $MAZE4).join("\n"))
        assert_equal($OUTPUT_MAZE5, main("paths", $MAZE5))
    end

    def test_public_print
    	$OUTPUT_MAZE4 = File.read("outputs/public_print_maze4.out")
        $OUTPUT_MAZE5 = File.read("outputs/public_print_maze5.out")

        assert_equal($OUTPUT_MAZE4, main("print", $MAZE4))
        assert_equal($OUTPUT_MAZE5, main("print", $MAZE5))
    end

    def test_public_solve
        $OUTPUT_MAZE4 = File.read("outputs/public_solve_maze4.out")
        $OUTPUT_MAZE5 = File.read("outputs/public_solve_maze5.out")

        assert_equal($OUTPUT_MAZE4, main("solve", $MAZE4).to_s)
        assert_equal($OUTPUT_MAZE5, main("solve", $MAZE5).to_s)
    end

    def test_public_bridge
        assert_equal(6, main("bridge", $MAZE1))
        assert_equal(6, main("bridge", $MAZE2))
        assert_equal(6, main("bridge", $MAZE3))
    end

    def test_public_distance2
    	$OUTPUT_MAZE1 = File.read("outputs/public_distance_maze1.out")
    	$OUTPUT_MAZE2 = File.read("outputs/public_distance_maze2.out")
    	$OUTPUT_MAZE3 = File.read("outputs/public_distance_maze3.out")

        assert_equal($OUTPUT_MAZE1, main("distance", $MAZE1))
        assert_equal($OUTPUT_MAZE2, main("distance", $MAZE2))
        assert_equal($OUTPUT_MAZE3, main("distance", $MAZE3))
    end

    def test_public_open2
        assert_equal(2, main("open", $MAZE1))
        assert_equal(2, main("open", $MAZE2))
        assert_equal(2, main("open", $MAZE3))
    end

    def test_public_paths2
    	$OUTPUT_MAZE1 = File.read("outputs/public_paths_maze1.out")
    	$OUTPUT_MAZE2 = File.read("outputs/public_paths_maze2.out")
    	$OUTPUT_MAZE3 = File.read("outputs/public_paths_maze3.out")

        assert_equal($OUTPUT_MAZE1, main("paths", $MAZE1))
        assert_equal($OUTPUT_MAZE2, main("paths", $MAZE2).join("\n"))
        assert_equal($OUTPUT_MAZE3, main("paths", $MAZE3).join("\n"))
    end

    def test_public_print2
    	$OUTPUT_MAZE1 = File.read("outputs/public_print_maze1.out")
    	$OUTPUT_MAZE2 = File.read("outputs/public_print_maze2.out")
    	$OUTPUT_MAZE3 = File.read("outputs/public_print_maze3.out")

        assert_equal($OUTPUT_MAZE1, main("print", $MAZE1))
        assert_equal($OUTPUT_MAZE2, main("print", $MAZE2))
        assert_equal($OUTPUT_MAZE3, main("print", $MAZE3))
    end

    def test_public_solve2
        assert_equal(true, main("solve", $MAZE1))
        assert_equal(true, main("solve", $MAZE2))
        assert_equal(false, main("solve", $MAZE3))
    end

    def test_public_sortcells
    	$OUTPUT_MAZE1 = File.read("outputs/public_sortcells_maze1.out")
    	$OUTPUT_MAZE2 = File.read("outputs/public_sortcells_maze2.out")
    	$OUTPUT_MAZE3 = File.read("outputs/public_sortcells_maze3.out")

        assert_equal($OUTPUT_MAZE1, main("sortcells", $MAZE1).join("\n"))
        assert_equal($OUTPUT_MAZE2, main("sortcells", $MAZE2).join("\n"))
        assert_equal($OUTPUT_MAZE3, main("sortcells", $MAZE3).join("\n"))
    end
end
