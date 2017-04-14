! ---------------------------------------------------------------------------
! Wave Module
!
! This module defines a linearWave type which implements the linear
!  convection equation.
!                  \frac{du}{dt} + c*\frac{du}{dx} = 0
! From the above the following discrete equation can be derived.
!     u_i^{n+1} = u_i^n - c \frac{\Delta t}{\Delta x}(u_i^n-u_{i-1}^n)
! Where n+1 and n are two consecutive steps in time and i and i-1 are two
!  neighbouring points in x.
!
! The linearWave initialization parameters:
!  nx    - number of points in x
!  h0    - relative height above the surface
!  h0_x1 - start of wave in x
!  h0_x2 - end of wave in x
!  dx    - differencial of x
!  dt    - differencial of t
!  c     - wave celerity (speed)
! ---
! C.Losada de la Lastra 2017
! --------------------------------------------------------------------------- !
module waveMod
  implicit none
!
! -- wave type
  type linearWave
    ! integer :: nx                   ! number of points in x
    ! real    :: h0, x1_h0, x2_h0     ! initial wave setting
    real    :: dx, dt, c
    real, allocatable :: u0(:),u(:) ! initial and current u
  contains
    procedure :: init!, update, reset_u0
  end type linearWave
contains
!
! --
  subroutine init(a,nx,h0,x1_h0,x2_h0,dx,dt,c)
    implicit none
    class(linearWave), intent(out) :: a
    integer, intent(in)            :: nx
    real, intent(in)               :: h0
    integer, intent(in)            :: x1_h0, x2_h0
    real, intent(in)               :: dx, dt, c
    integer :: i
    a%dx = dx
    a%dt = dt
    a%c  = c
    allocate(a%u0(1:nx),a%u(1:nx))
    a%u0 = (/(1, i=1,nx)/)
  end subroutine init
end module waveMod
