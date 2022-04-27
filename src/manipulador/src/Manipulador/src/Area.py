class Area:
    """
    Initializes an area based on its height, width and position
    """
    def __init__(self, height, width, position):
        self.height = height
        self.width = width
        self.position = position

    def is_inside(self, point):
        """
        Checks if a point is inside the area
        """
        if point[0] > self.position[0] and point[0] < self.position[0] + self.width and point[1] > self.position[1] and point[1] < self.position[1] + self.height:
            return True
        else:
            return False

    def is_outside(self, point):
        """
        Checks if a point is outside the area
        """
        if point[0] < self.position[0] or point[0] > self.position[0] + self.width or point[1] < self.position[1] or point[1] > self.position[1] + self.height:
            return True
        else:
            return False

    def is_on_border(self, point):
        """
        Checks if a point is on the border of the area
        """
        if point[0] == self.position[0] or point[0] == self.position[0] + self.width or point[1] == self.position[1] or point[1] == self.position[1] + self.height:
            return True
        else:
            return False

    def is_inside_border(self, point):
        """
        Checks if a point is inside the border of the area
        """
        if point[0] > self.position[0] and point[0] < self.position[0] + self.width and point[1] > self.position[1] and point[1] < self.position[1] + self.height:
            return True
        else:
            return False

    def get_points2d(self, steps):
        """
        Returns a list of points along the border of the area with a given number of steps per side
        """
        # initialize empty list
        points = []

        # get the points at the bottom reversed
        for i in range(steps + 1):
            points.append([self.position[0] + i * self.width / steps, self.position[1]])

        # get the points at the right from top to bottom
        rightPoints = []
        for i in range(steps + 1):
            rightPoints.append([self.position[0] + self.width, self.position[1] - self.width + i * self.height / steps])
        points.extend(rightPoints[::-1])

        # get points at the bottom reversed
        bottomPoints = []
        for i in range(steps + 1):
            bottomPoints.append([self.position[0] + .5 + i * (self.width-.5) / steps, self.position[1] - self.width])
        points.extend(bottomPoints[::-1])

        return points