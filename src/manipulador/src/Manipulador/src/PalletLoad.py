from . import Box # when called from main scripts
#from Box import Box # for testing only this file
#import matplotlib.pyplot as plt
import math

class Pallet:
    """
    this class has to count how many boxes there are in the pallet and where they are relative to the pallet
    It has a maximum width, height and depth and a maximum height of boxes
    It organazes the boxes in a grid with the maximum width, height and depth
    It stacks grids up to the maximum height of boxes
    Grid is divided into rows and each row has a given number of boxes
    """
    def __init__(self, max_width, max_depth, max_box_height, type_of_box_per_row):
        self.max_width = max_width
        self.max_depth = max_depth
        self.max_height_in_boxes = max_box_height
        self.boxes = type_of_box_per_row
        self.gridStack = self.populate_stack(self.max_height_in_boxes)
        

    def populate_stack(self, max_height_in_boxes:int):
        """
        Populates the stack of grids of boxes
        """
        stack = []
        # row boxes from bottom to top (I think)
        #boxes = [Box(.40, .27, .27), Box(.40, .27, .27), Box(.27, .27, .40)] # esta es a configuración de cajas desde la vista superior
        self.boxes.reverse()
        # populate stack with rows
        for i in range(max_height_in_boxes):
            stack.append(self.populate_grid(self.boxes, 3, i))
            self.boxes.reverse()

        return stack

    def populate_grid(self, boxes:list, rows:int, current_stack:int):
        """
        Populates the grid with boxes
        """
        # check if len of boxes is equal to rows otherwise raise error
        if len(boxes) != rows:
            raise ValueError("Number of rows is not equal to number of boxes")

        grid = []
        for i, box in enumerate(boxes):
            if i == 0:
                depthOffset = boxes[i].depth/2
            elif i == 1:
                depthOffset = boxes[i].depth/2 + boxes[i-1].depth
            elif i == 2:
                depthOffset = boxes[i].depth/2 + boxes[i-1].depth + boxes[i-2].depth

            row = self.populate_row(box, depthOffset,current_stack)
            grid.append(row)
        return grid
        

    def populate_row(self, box:Box, boxDepthOffset, current_stack:int):
        """
        Populates a row with as much boxes posible given the width of the pallet
        """
        row = []
        boxWidth = box.width
        boxdepth = box.depth

        # quick fix for las cajas de ricolino
        if self.max_width / boxWidth < 3:
            boxesInRow = int(math.ceil(self.max_width / boxWidth))
        else:
            boxesInRow = int(self.max_width / boxWidth)

        # find the number of boxes that fit in the pallet
        #boxesInRow = int(math.ceil(self.max_width / boxWidth))
        #boxesInRow = int(self.max_width / boxWidth)

        # populate row with boxes
        for i in range(boxesInRow):
            # add box to row
            row.append([i * (boxWidth + .03) + boxWidth/2,  boxDepthOffset, current_stack])
        
        return row


# uncoment to test
""" if __name__ == "__main__":
    pallet = Pallet(1.2, 1, 4,[Box(.40, .27, .27), Box(.40, .27, .27), Box(.27, .27, .40)])
    #print(pallet.gridStack)

    # plot the grid in 3D
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    for stack in pallet.gridStack:
        for row in stack:
            for box in row:
                # change color of the point based on current stack
                if box[2] == 1:
                    color = 'red'
                elif box[2] == 2:
                    color = 'green'
                elif box[2] == 3:
                    color = 'blue'
                else:
                    color = 'black'
                ax.scatter(box[0], box[1], box[2], c=color, marker='o')
    # label the axes
    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.set_zlabel("Z")
    plt.show() """