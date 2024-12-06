from pathlib import Path
from itertools import product

def parse_problem(problem_file: Path):
    grid = []
    with problem_file.open('r') as f:
        for line in f.readlines():
            grid.append(list(map(int, line.split())))
    return grid


def prod_horiz(grid, i, j):
    if j + 4 > len(grid[0]):
        return 0
    return grid[i][j] * grid[i][j + 1] * grid[i][j + 2] * grid[i][j + 3]


def prod_vert(grid, i, j):
    if i + 4 > len(grid):
        return 0
    return grid[i][j] * grid[i + 1][j] * grid[i + 2][j] * grid[i + 3][j]


def prod_diag1(grid, i, j):
    if i + 4 > len(grid) or j + 4 > len(grid[0]):
        return 0
    return grid[i][j] * grid[i + 1][j + 1] * grid[i + 2][j + 2] * grid[i + 3][j + 3]


def prod_diag2(grid, i, j):
    if i + 4 > len(grid) or j + 4 > len(grid[0]):
        return 0
    return grid[i + 3][j] * grid[i + 2][j + 1] * grid[i + 1][j + 2] * grid[i][j + 3]


max_prod = 0
grid = parse_problem(Path("./problem.txt"))
for i in range(len(grid)):
    for j in range(len(grid[i])):
        max_prod = max(
            max_prod,
            prod_horiz(grid, i, j),
            prod_vert(grid, i, j),
            prod_diag1(grid, i, j),
            prod_diag2(grid, i, j),
        )

print(f"The maximum product is {max_prod}")