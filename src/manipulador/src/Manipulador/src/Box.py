class Box:
    """
    This class is used to get and set different box sizes
    Each box has an ID
    """
    def __init__(self, width, height, depth):
        self.width = width
        self.height = height
        self.depth = depth
        
        # get box center
        self.boxCenter = [self.width/2, self.height/2, self.depth/2]