from OpenGL.GLUT import *
from OpenGL.GLU import *
from OpenGL.GL import *

#PIRAMIDE DE BASE QUADRADA(HARDCODED)

#Face quadrado
#facesQuadrado = ((0,1,2,3),(0,0))
#linhas do quadrado
linhas = (
    (1,2),
    (2,3),
    (3,4),
    (4,1)
    )
#Vertice Quadrado
verticeQuadrado = (
    ( 1,-1,-1),
    ( -1, -1,-1),
    (-1, -1,1),
    (1,-1,1),
	)
#Vertice Triangulo
verticeTriangulo = (
	(0,1,0),
    (-1,-1,1),
    (1,-1,1),
    (1,-1,-1),
    (-1,-1,-1),
    (-1,-1,1),
	)
#cores = ( (1,0,0),(1,1,0),(0,1,0),(0,1,1),(0,0,1),(1,0,1),(0.5,1,1),(1,0,0.5) )
#Triangulo =
def Cubo():
    glBegin(GL_QUADS)
    glColor3fv((1,1,1))
    for verticeQuad in range(0,4):
    	glVertex3fv(verticeQuadrado[verticeQuad]);
    glEnd()

    glBegin(GL_TRIANGLE_FAN)
    glColor3fv((1,1,0.5))
    for verticeTriang in range(0,6):
    	glVertex3fv(verticeTriangulo[verticeTriang]);
    glEnd()
    glBegin(GL_LINES)
    glColor3fv((0,0,0))
    for line in linhas:
    	for vertice in line:
    		glVertex3fv(verticeTriangulo[vertice])
    glEnd()
    #glEnd()

def abacaxi():
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
    glRotatef(2,1,3,0)
    Cubo()
    glutSwapBuffers()
 
def timer(i):
    glutPostRedisplay()
    glutTimerFunc(50,timer,1)

# PROGRAMA PRINCIPAL
glutInit(sys.argv)
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH | GLUT_MULTISAMPLE)
glutInitWindowSize(800,600)
glutCreateWindow("Triangulo de base quadrada")
glutDisplayFunc(abacaxi)
glEnable(GL_MULTISAMPLE)
glEnable(GL_DEPTH_TEST)
glClearColor(0.,0.,0.,1.)
gluPerspective(45,800.0/600.0,0.1,50.0)
glTranslatef(0.0,0.0,-10)
#glRotatef(45,1,1,1)
glutTimerFunc(50,timer,1)
glutMainLoop()


