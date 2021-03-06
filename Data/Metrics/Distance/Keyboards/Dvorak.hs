module Data.Metrics.Distance.Keyboards.Dvorak (
    dvorakCoords
    ) where

import Data.Maybe
import qualified Data.Map.Strict as M

dvorakCoords :: M.Map Char (Int, Int)
dvorakCoords = M.union dvorakUnshifted dvorakShifted

dvorakUnshifted :: M.Map Char (Int, Int)
dvorakUnshifted = M.fromList
    [ ('`', (-6, 2)), ('1', (-5, 2)), ('2', (-4, 2)), ('3', (-3, 2))
    , ('4', (-2, 2)), ('5', (-1, 2)), ('6', (1, 2)), ('7', (2, 2))
    , ('8', (3, 2)), ('9', (4, 2)), ('0', (5, 2)), ('[', (6, 2))
    , (']', (7, 2)), ('\t', (-6, 1)), ('\'', (-5, 1)), (',', (-4, 1))
    , ('.', (-3, 1)), ('p', (-2, 1)), ('y', (-1, 1)), ('f', (1, 1))
    , ('g', (2, 1)), ('c', (3, 1)), ('r', (4, 1)), ('l', (5, 1))
    , ('/', (6, 1)), ('=', (7, 1)), ('\\', (8, 1)), ('a', (-5, 0))
    , ('o', (-4, 0)), ('e', (-3, 0)), ('u', (-2, 0)), ('i', (-1, 0))
    , ('d', (1, 0)) , ('h', (2, 0)), ('t', (3, 0)), ('n', (4, 0))
    , ('s', (5, 0)) , ('-', (6, 0)), ('\n', (7, 0)), (';', (-4, -1))
    , ('q', (-3, -1)) , ('j', (-2, -1)), ('k', (-1, -1)), ('x', (0, -1))
    , ('b', (1, -1)) , ('m', (2, -1)), ('w', (3, -1)), ('v', (4, -1))
    , ('z', (5, -1))
    ]

dvorakShifted :: M.Map Char (Int, Int)
dvorakShifted = M.mapKeys (\k -> fromMaybe k $ dvorakShift M.!? k) dvorakUnshifted

dvorakShift :: M.Map Char Char
dvorakShift = M.fromList
    [ ('`', '~'), ('1', '!'), ('2', '@'), ('3', '#'), ('4', '$')
    , ('5', '%'), ('6', '^'), ('7', '&'), ('8', '*'), ('9', '(')
    , ('0', ')'), ('[', '{'), (']', '}'), ('\'', '"'), (',', '<')
    , ('.', '>'), ('p', 'P'), ('y', 'Y'), ('f', 'F'), ('g', 'G')
    , ('c', 'C'), ('r', 'R'), ('l', 'L'), ('/', '?'), ('=', '+')
    , ('\\', '|'), ('a', 'A'), ('o', 'O'), ('e', 'E'), ('u', 'U')
    , ('i', 'I'), ('d', 'D'), ('h', 'H'), ('t', 'T'), ('n', 'N')
    , ('s', 'S'), ('-', '_'), (';', ':'), ('q', 'Q'), ('j', 'J')
    , ('k', 'K'), ('x', 'X'), ('b', 'B'), ('m', 'M'), ('w', 'W')
    , ('v', 'V'), ('z', 'Z')
    ]
