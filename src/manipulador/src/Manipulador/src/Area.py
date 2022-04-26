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